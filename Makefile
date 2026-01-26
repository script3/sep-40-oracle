default: build

test: build
	cargo test --all --tests

build:
	stellar contract build --package mock-sep-40-oracle --optimize
	cp -f target/wasm32v1-none/release/mock_sep_40_oracle.wasm sep-40/src/testutils/mock_sep_40_oracle.wasm
	cargo build -p sep-40-oracle
	cargo build -p sep-40-oracle --features testutils

fmt:
	cargo fmt --all

clean:
	cargo clean
