# Values file for Sample-CIAM Helm chart

This chart will stand by itself, but will not be automatically integrated with PingOne Services, including My Ping.

You can use the details from the Administration Connections that you created in PingOne ([My Ping Integration](./sso-myping.md)) in a `values.yaml` file that will create all the necessary components and configuration.

## Sample Values

```yaml
global:
  # Your specific environment variables - values are injected into Server Profiles
  envs:
    # Environment Name used in My Ping and Admin Consoles
    ENVIRONMENT_NAME: "Sample-CIAM"
    # Default Administrative Password - passed to APIs as {{globalPwd}}
    PING_IDENTITY_PASSWORD: "2FederateM0re"

# PingOne Service Details
pingOne:
  # Set to `true` if you are supplying your PingOne details 
  # C360 leverages PingOne MFA by default
  usePingOneServices: true
  # This configures the proper endpoints for My Ping and PingOne Service IKs
  # PingOne Regions - "NA" | "EU" | "AP"
  envRegion: "NA"
  # If using My Ping - enter the details for the Admin SSO Connection here
  # https://github.com/cprice-ping/Customer360/blob/main/docs/sso-myping.md
  administration:
    # Set to `true` to enable My Ping - if `false`, Admin consoles will use LDAP (PF \ PD) or Native (PC \ PA)
    useMyPing: false
    # Configure these values if `useMyPing` == true
    envId: "YourAdminEnvId"
    adminUserId: "YourAdminUserID" # Not Username - the UUID on the API tab
    logonApp:
      id: "YourAdminApp"
      secret: "YourAdminSecret"
    # Admin Environment's Worker App (Configured in Connections --> Worker) - with AdminUser permissions
    workerApp:
      id: "YourPFWorkerAppID"
      secret: "YourPFWorkerAppSecret"
```