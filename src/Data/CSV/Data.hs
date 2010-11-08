{-# LANGUAGE OverloadedStrings, BangPatterns #-}
{-# LANGUAGE PackageImports #-}
{-# LANGUAGE TypeSynonymInstances #-}


module Data.CSV.Data where


import qualified Data.ByteString as B
import qualified Data.Map as M

-- | Settings for a CSV file. This library is intended to be flexible and offer a way to process the majority of text data files out there.
data CSVSettings = CSVS
  { 
    -- | Separator character to be used in between fields
    csvSep :: Char          

    -- | Quote character that may sometimes be present around fields. If 'Nothing' is given, the library will never expect quotation even if it is present.
  , csvQuoteChar :: Maybe Char
  
    -- | Quote character that should be used in the output.
  , csvOutputQuoteChar :: Char
  
    -- | Field separator that should be used in the output.
  , csvOutputColSep :: Char
  } deriving (Read, Show, Eq)

-- | Default settings for a CSV file. See source for what they are.
defCSVSettings :: CSVSettings
defCSVSettings = CSVS
  { csvSep = ','
  , csvQuoteChar = Just '"'
  , csvOutputQuoteChar = '"'
  , csvOutputColSep = ','
  } 

type Row = [Field]
type Field = B.ByteString
type MapRow = M.Map B.ByteString B.ByteString

