module Text.Sitemap
  ( SitemapEntry (..),
    Sitemap (..),
    SitemapIndex (..),
    ChangeFrequency (..),
  )
where

import Data.Text (Text)
import Data.Time (UTCTime)

data ChangeFrequency
  = Always
  | Hourly
  | Daily
  | Weekly
  | Monthly
  | Yearly
  | Never
  deriving stock (Show, Eq, Ord)

data SitemapEntry = SitemapEntry
  { loc :: Text,
    lastModified :: Maybe UTCTime,
    changeFreq :: Maybe ChangeFrequency,
    priority :: Maybe Double
  }
  deriving stock (Show, Eq, Ord)

data Sitemap = Sitemap
  { urls :: [SitemapEntry]
  }
  deriving stock (Show, Eq, Ord)

data SitemapIndex = SitemapIndex
  { sitemaps :: [Sitemap]
  }
  deriving stock (Show, Eq, Ord)