local kp = (import 'kube-prometheus/kube-prometheus.libsonnet');
{ ['grafana-dashboard-' + name]: kp.grafanaDashboards[name] for name in std.objectFields(kp.grafanaDashboards) }
