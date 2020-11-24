{{/* Helpers for the Product Port Numbers */}}

{{/* PingDirectory ConfigAPI */}}
{{- define "pingports.pdConfigPort" -}}
    {{- print (index .Values "ping-devops").pingdirectory.services.https.port }}
{{- end }}

{{/* PingDirectory non-ConfigAPI */}}
{{- define "pingports.pdApiPort" -}}
    {{- print (index .Values "ping-devops").pingdirectory.services.apis.port }}
{{- end }}

{{/* PingDirectory LDAP */}}
{{- define "pingports.pdLdapPort" -}}
    {{- print (index .Values "ping-devops").pingdirectory.services.ldap.port }}
{{- end }}

{{/* PingDirectory LDAPS */}}
{{- define "pingports.pdLdapsPort" -}}
    {{- print (index .Values "ping-devops").pingdirectory.services.ldaps.port }}
{{- end }}

{{/* PingDataConsole HTTPS */}}
{{- define "pingports.pdConsolePort" -}}
    {{- print (index .Values "ping-devops").pingdataconsole.services.https.port }} 
{{- end }}

{{/* PingFederate Admin */}}
{{- define "pingports.pfAdminPort" -}}
    {{- print (index .Values "ping-devops" "pingfederate-admin" ).services.admin.port }} 
{{- end }}

{{/* PingFederate Runtime */}}
{{- define "pingports.pfEnginePort" -}}
    {{- print (index .Values "ping-devops" "pingfederate-engine" ).services.engine.port }}
{{- end }}

{{/* PingDelegator */}}
{{- define "pingports.pingDelegatorPort" -}}
    {{- print (index .Values "ping-devops" ).pingdelegator.services.https.port }}
{{- end }}

{{/* PingAccess Admin */}}
{{- define "pingports.paAdminPort" -}}
    {{- print 9000 }} 
{{- end }}

{{/* PingCentral Admin */}}
{{- define "pingports.pcAdminPort" -}}
    {{- print 9022 }} 
{{- end }}
