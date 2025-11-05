{{- define "fullname" -}}
{{ .Release.Name }}-grafana
{{- end -}}
{{- define "grafana.fullname" -}}
{{- printf "%s-%s" .Release.Name "grafana" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "grafana.name" -}}
grafana
{{- end -}}
