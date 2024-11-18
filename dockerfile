FROM rust:alpine AS build
WORKDIR /src
COPY <<EOT hello.rs
fn main() {
    println!("Hello World!");
}
EOT
RUN rustc -o /bin/hello hello.rs
RUN sha256sum /bin/hello

FROM scratch
COPY --from=build /bin/hello /
ENTRYPOINT ["/hello"]
