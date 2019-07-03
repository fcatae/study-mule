%dw 2.0
output application/json

var directorIDs = ["JKLS483S","FJSA48JD","NMA4FJ9K"]

//Combines Accounts and Transactions by the Account ID. Assigns each account to a
//director
fun consolidateAccountsTrans (payload) =
  payload.accounts map ( (account, index) ->
  using (id = account.id as String)
  (
    account ++
    {
      transactions: payload.transactions filter ($.customerRef == id)
    } ++
    {
      assignedDirector: directorIDs[mod(index, sizeOf(directorIDs))]
    }
  )
)
---
using (data = consolidateAccountsTrans(payload))
(data groupBy $.assignedDirector)
