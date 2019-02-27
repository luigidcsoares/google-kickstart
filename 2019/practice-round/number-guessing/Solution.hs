import           System.IO                      ( hSetBuffering
                                                , BufferMode(NoBuffering)
                                                , stdout
                                                )

guessNumber :: (Show a, Eq a, Integral a) => a -> a -> a -> IO String
guessNumber a b 0 = getLine -- Reads a "wrong answer".
guessNumber a b n =
  let guess = (a + b) `div` 2
  in  do
        print guess
        response <- getLine
        case response of
          "CORRECT"   -> return response
          "TOO_SMALL" -> guessNumber (guess + 1) b (n - 1)
          "TOO_BIG"   -> guessNumber a (guess - 1) (n - 1)

solve :: Int -> IO ()
solve t = do
  line <- getLine
  let [a, b] = map (read :: String -> Int) . words $ line
  n        <- readLn :: IO Int
  response <- guessNumber (a + 1) b n
  case response of
    "WRONG_ANSWER" -> return ()
    _              -> if t - 1 == 0 then return () else solve (t - 1)

main :: IO ()
main = do
  hSetBuffering stdout NoBuffering
  t <- readLn :: IO Int
  solve t
