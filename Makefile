build:
	rm -rf public
	hugo

delpoy: build
	aws s3 sync public/ s3://elearnvietnamese.com --acl public-read --delete
	aws configure set preview.cloudfront true
	aws cloudfront create-invalidation --distribution-id E13NZNX2N2BXWK --paths '/*'