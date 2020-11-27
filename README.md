# Generate kube-prometheus Grafana dashboards

This repository allows to generate the set of Grafana dashboard included in [kube-prometheus](https://github.com/prometheus-operator/kube-prometheus). 

The dashboards are generated as separate JSON files that can be directly imported into Grafana (e.g. through the [Grafana HTTP API](https://grafana.com/docs/grafana/latest/http_api/)).

## Usage

1. Choose the kube-prometheus version that you want to use (version may be any valid Git ref, e.g., tag or branch).

    For example:
    ```bash
    VERSION=v0.6.0
    # or
    VERSION=master
    ```

2. Install kube-prometheus Jsonnet libraries of the chosen version:
    ```bash
    jb init
    jb install github.com/prometheus-operator/kube-prometheus/jsonnet/kube-prometheus@"$VERSION"
    ```

3. Generate the Grafana dashboards:
    ```
    mkdir dashboards
    jsonnet -J vendor -m dashboards dashboards.jsonnet
    ```

    > Tip: instead of the default [Jsonnet](https://github.com/google/jsonnet) implementation (`jsonnet`), use [Sjsonnet](https://github.com/databricks/sjsonnet) (`sjsonnet`) which is much faster (see below for installation instructions).

That's it. All the dashboard definitions should now be located in the `dashboards` folder.

## Dependencies

- jsonnet-bundler (`jb`):
    ```bash
    brew install jsonnet-bundler
    ```
- Sjsonnet (_recommended_):
    ```bash
    curl -L https://github.com/lihaoyi/sjsonnet/releases/download/0.2.7/sjsonnet.jar >sjsonnet
    chmod +x sjsonnet
    ```
- Go Jsonnet (_acceptably fast_)
    ```bash
    brew install go-jsonnet
    ```
- Jsonnet (_slow_):
    ```bash
    brew install jsonnet
    ```
