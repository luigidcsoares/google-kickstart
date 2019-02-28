import           Data.Char                      ( digitToInt )
import qualified Data.Sequence                 as Seq

maxScores :: String -> Int
maxScores [] = 0
maxScores xs = go table 0
 where
  half  = length xs `div` 2 + (fromEnum . odd $ length xs)
  table = Seq.fromList $ 0 : (scanl (\acc x -> digitToInt x + acc) 0 $ xs)

  -- | Helper function which receives a Sequence that contains the sum of
  -- every existing subsequence. Since we know that for every value included
  -- in the sum, one is deleted, we know that the size of every subset will
  -- be the half of the number of digits (for even length), and so we can
  -- prove that we just need to subtract the current sum from the sum of
  -- the last subset that does not include the current element.
  go t s
    | length t <= half = s
    | otherwise = go (Seq.drop 1 t)
    $ max s (t `Seq.index` half - t `Seq.index` 0)

 -- In case input hasn't the last newline character.
solve []              _ = return ()
-- In case input has the last newline character.
solve [newline      ] _ = return ()
solve (_ : sc : rest) c = do
  putStrLn $ "Case #" ++ (show c) ++ ": " ++ (show . maxScores $ sc)
  solve rest (c + 1)

main :: IO ()
main = do
  t        <- readLn :: IO Int

  -- Use `getContents` to get a lazy collection and avoid memory limit
  -- exceeded.
  contents <- getContents
  solve (lines contents) 1
