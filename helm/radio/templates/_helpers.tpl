{{/* Generate basic labels */}}
{{- define "radio.labels" }}
    generator: helm
    date: {{ now | htmlDate }}
{{- end }}
