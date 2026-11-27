ROOMSYNC — Shared Room Manager

WHAT'S INCLUDED
- index.html: responsive app for phone, tablet and PC
- schema.sql: Supabase database setup for shared cloud synchronisation

FEATURES
- Six roommate profiles
- Weekly contributions
- Shared expenses and automatic equal split across six people
- Individual net balances / ledgers
- Shared transaction register
- Weekly rotating duties
- Weekly meal menu and grocery checklist

IMPORTANT FINANCIAL LOGIC
Each contribution is credited to the roommate who paid it.
Each expense is split equally across all six roommates.
Individual net balance = that person's contributions - one-sixth of all shared expenses.
Positive means they have contributed more than their calculated share; negative means they owe.
Room cash balance = all contributions - all expenses.

RUN LOCALLY
Open index.html in a modern browser. In demo mode data is saved only in that browser on that device.

ENABLE SHARED SYNC (RECOMMENDED)
1. Create a free project at https://supabase.com.
2. In the Supabase SQL Editor, run the contents of schema.sql.
3. In Project Settings > API, copy the Project URL and anon/publishable key.
4. Open the app > Cloud setup. Paste the URL and anon/publishable key and connect.
5. Host the contents of this folder on a static host (Netlify, Vercel, GitHub Pages, etc.).
6. Everyone opens the same deployed app address and enters the same Supabase URL/key once.
7. Transactions and changes then sync through the shared database.

SECURITY NOTE
This is a starter shared-room app. The included SQL policies allow anyone with the project URL and anon key to read/write the single shared room record. Do not put private or sensitive information in it, and only share the app with your roommates. For stronger access control, add Supabase Auth and per-user permissions before public deployment. Never use the Supabase service-role key in the browser.

LIMITATIONS / NEXT ITERATION
- All six people currently have equal expense shares.
- The duty schedule assigns duties in a weekly rotating sequence.
- No user login, receipt image uploads, export-to-Excel, or transaction correction/audit workflow yet.
- For a live shared system, all users must use the same deployed app and same Supabase project.

NEW FEATURES IN THIS VERSION
- Monthly closing preview and printable statement
- Month-end snapshot of contributions, expenses, net cash movement and each roommate's ledger balance
- Closed months block new transactions dated in that month
- Manager-only transaction entry gate using a PIN on each device

IMPORTANT ACCESS-CONTROL LIMITATION
The PIN gate in this starter version is a local convenience lock, not secure identity/access control. The manager must set the same PIN on their device and unlock entry there. For real enforcement across all six devices (so other roommates cannot bypass the browser), implement Supabase Auth with a manager role and server-side Row Level Security. Do not treat the local PIN as a security boundary.
