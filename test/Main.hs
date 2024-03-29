module Main
  ( main,
  )
where

import Data.Text.Lazy.Encoding qualified as TLE
import Test.Tasty (TestTree, defaultMain, testGroup)
import Test.Tasty.Golden (goldenVsString)
import Text.Sitemap (renderSitemapIndexWith, renderSitemapWith)
import Text.XML (RenderSettings (..))
import Text.XML qualified as XML

main :: IO ()
main = defaultMain =<< renderingTests

renderingTests :: IO TestTree
renderingTests = do
  pure $
    testGroup
      "XML rendering"
      [ goldenVsString
          "default sitemap"
          "test/spec/sitemap.xml"
          (TLE.encodeUtf8 . renderSitemapWith (XML.def {rsPretty = True}) <$> (read <$> readFile "./test/spec/sitemap.data")),
        goldenVsString
          "default sitemap index"
          "test/spec/index.xml"
          (TLE.encodeUtf8 . renderSitemapIndexWith (XML.def {rsPretty = True}) <$> (read <$> readFile "./test/spec/index.data"))
      ]
