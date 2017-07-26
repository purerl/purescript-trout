module Type.Trout.ContentType.JSON where

import Prelude
import Erl.Data.Jsone.Encode.Class (class EncodeJson, encodeJson)
import Erl.Data.Jsone.Printer (printJson)
import Data.MediaType.Common (applicationJSON)
import Data.Tuple (Tuple(..))
import Type.Trout.ContentType (class AllMimeRender, class HasMediaType, class MimeRender, getMediaType, mimeRender)

-- | A content type, corresponding to the `application/json` media type.
data JSON

instance hasMediaTypeJson :: HasMediaType JSON where
  getMediaType _ = applicationJSON

instance mimeRenderJson :: EncodeJson a => MimeRender a JSON String where
  mimeRender _ = printJson <<< encodeJson

instance allMimeRenderJson :: EncodeJson a => AllMimeRender a JSON String where
  allMimeRender p x = pure (Tuple (getMediaType p) (mimeRender p x))
