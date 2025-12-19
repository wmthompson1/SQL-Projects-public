Specifying Auto-issue Preferences




# Specifying Auto-issue Preferences

1. Select Admin, Preferences Maintenance.
2. In the Section Filter
   field, select LaborEntry.
3. Click Insert
   Row.
4. In the LaborEntry section,
   specify these preferences:

| Entry | Description |
| AutoIssueFixedScrap | Specify Y to also auto-issue the fixed scrap that is specified for the material requirement. If you specify Y, the fixed scrap is issued in the first auto-issue transaction that is made for the operation.  Specify N if you do not want to auto-issue fixed scrap. If you specify N, fixed scrap quantities must be issued manually.  If you do not specify a setting, then fixed scrap is auto-issued. |
| AutoIssueMaterialReq | Specify Y to auto-issue material requirements to cover deviated quantities. For example, if the Qty Per for the material requirement is 1, and you complete 5 acceptable units and 2 deviated units, then a total of 7 units of the material requirement is issued to the operation. If you also auto-issue fixed scrap, then the fixed scrap quantity is also issued.  If you use the Based on the Full Requirement Qty on First Labor Ticket auto-issue method, then deviated quantities that are reported on the first labor ticket are included in the total amount of material auto-issued to the operation. Deviated quantities that are specified on subsequent labor tickets are not included in the auto-issue calculation.  Specify N if you do not want to issue material for deviated quantities.  If you do not specify a setting, then requirements are not auto-issued for deviated quantities. |

5. Click Save.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Auto-issue_Parts.md)
Auto-issue Parts