.PHONY: docs-build

docs-build:
	swift package --allow-writing-to-directory ./.docc-build \
		generate-documentation \
		--target SpecNode \
		--output-path ./.docc-build \
		--transform-for-static-hosting \
		--hosting-base-path SpecNode
