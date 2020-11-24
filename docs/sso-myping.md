# Admin SSO via My Ping Console

"My Ping" is the Ping Deployment Console that gives you a single place to Manage and Access all of your Ping Environment(s) - Software and Services. SSO into your Administration Console is achieved by OIDC - using PingOne as the token provider.

## PingOne configuration

1. Create an Environment for your Admin SSO configuration
2. Extend the Directory to add new Attributes -- P1 doesn't support Groups, and Software doesn't handle GroupDNs well. Sample-CIAM hardcodes values into the Software SSO config (see below)
3. Map the extended attributes to the Attribute Mapping in the Connection
4. Add Administrator User(s) - add the values (see below) to the Users
5. Create new Connections

This can be done for a Single Admin --> Multiple Envs, or for a seperate Admin Env where you want Branding \ different Policy for the Administrators

### Directory Settings

* Directory (Settings --> Directory --> Attributes)
  * Select **Add Attribute**
  * Choose **Declared** - to hold the values of the claims that authorize access to Products

    | Attribute Name | Display Name |
    | --- | --- |
    | `pf-admin-roles`| PingFed Admin Roles |
    | `pc-admin-roles` | PingCentral Admin Roles |

### Identities

* Create Administrator account
* Populate the Roles on the Administrator Identities with the value mapped in the Product properties (See below)
  * look for **Other** and find the attribute Display Names that you have created earlier

  | Product | Claim Name | Value |
  | --- | --- | --- |
  | PingFederate | `name` | `formatted.name` | Name of Administrator |
  | | `pf_admin_roles` | `fullAdmin` (defined in `oidc.properties`) |
  | PingCentral | `pc_admin_roles` | `IAM-Admin` or `AppOwner` (defined in `application.properties`) |

### Connection Settings - Native App

* Create new Connection:
  * Select **Add Application**
  * Choose **Native App**, then **OIDC**

#### Configuration

  | Configuration | Selections |
  | --- | --- |
  | Response Type | `Code` `Token` `ID Token` |
  | Grant Type | `Authorization Code` `Implicit` |
  | Token Endpoint AuthN | `Client Secret Basic` |

#### Attribute Mappings

  | PingOne User Attribute | Application Attribute |
  | --- | --- |
  | Formatted | Name |
  | PingFed Admin Roles | `pf-admin-roles` |
  | PingCentral Admin Roles | `pc-admin-roles` |
  | User ID | `sub` |

### Connection Settings - Worker App

* Create new Connection:
  * Select **Add Application**
  * Choose **Worker App**

#### Roles

Roles should be inherited according to your Admin Account rights - Separate PoC Environments will want to limit this to just the Administrative Environment