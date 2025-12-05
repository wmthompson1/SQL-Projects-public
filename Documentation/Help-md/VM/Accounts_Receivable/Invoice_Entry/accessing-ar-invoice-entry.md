# Accessing A/R Invoice Entry

This page documents common ways to open the Invoice Entry window and the typical permissions or settings required.

## Navigation / Menu Path

- From the main application menu: **Modules → Accounts Receivable → Invoice Entry**
- From a quick-access toolbar or Favorites list: open your configured Favorites and select **Invoice Entry**
- From a context menu (e.g., on a customer or order): look for **Create Invoice** or **Open Invoice Entry** depending on the workflow configuration

> Note: Exact menu labels may vary slightly by VISUAL version and site configuration. Use the application search/command palette (if available) to type "Invoice Entry" and jump to the window.

## Shortcuts and Auto-Navigation

- Keyboard shortcuts: Some installations map a function key or CTRL/ALT shortcut to open Invoice Entry. Check `Help → Keyboard Shortcuts` in your environment.
- From other modules: many screens (Sales Order, Shipping, Receipts) include a link or button to create an invoice; these will open Invoice Entry with relevant fields pre-filled.

## Permissions and Roles

- Required role: Users must have the A/R Invoice Entry role or the specific permission that allows creating and editing A/R invoices. Typical permission names include **AR: Invoice Entry**, **AR: Create Invoice**, or **AR: Post Invoice**.
- Read-only vs edit: Users without edit permission can typically view invoices but cannot save changes or post.
- Multi-site access: If your license includes multiple sites, ensure the user has access to the target Site ID shown in the header; otherwise the Site ID selector may be restricted.

## Common Issues When Accessing Invoice Entry

- "Window not found" — verify the feature/module is installed and your account has it enabled.
- Menu item disabled/grayed out — confirm your role includes Create/Edit permissions and that the current company/site context allows invoice creation.
- Pre-filled fields missing — if Invoice Entry was opened from a related screen (sales order/shipment) and fields are empty, recreate the link from the originating screen to ensure context is passed.

Index: `../../Accounts_Receivable_INDEX.md`
