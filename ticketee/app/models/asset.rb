class Asset < ActiveRecord::Base
  belongs_to :ticket

  mount_uploader :asset, AssetUploader
end
