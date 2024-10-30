{{- define "common_label_match_expressions" }}
- key: environment
  operator: In
  values:
    - {{ .Values.environment }}
- key: app
  operator: In
  values:
    - {{ .Values.app }}
- key: deployment
  operator: In
  values:
    - {{ .Values.deployment }}
{{- end }}

{{- define "common_labels" }}
app: {{ .Values.app }}
environment: {{ .Values.environment }}
deployment: {{ .Values.deployment }}
{{- end }}

{{- define "node_affinity_requirements" }}
{{- if gt (len .Values.nodeAffinityRequirements) 0 }}
nodeAffinity:
  requiredDuringSchedulingIgnoredDuringExecution:
    nodeSelectorTerms:
      - matchExpressions:
        {{- range .Values.nodeAffinityRequirements }}
        - key: {{.label}}
          operator: In
          values:
            - {{.value}}
        {{- end }}
{{- end }}
{{- end }}