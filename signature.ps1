$signature = @'
ANY Signature, or Generator like https://www.mail-signatures.com/signature-generator/
'@

      $web = wget "https://raw.githubusercontent.com/jahube/Signature/main/Template.html"
$signature = [System.Web.HttpUtility]::HtmlDecode($web.content)

$Param = @{SignatureHtml = $signature
           SignatureText = $null
   SignatureTextOnMobile = $null
        AutoAddSignature = $true }

# One User
Set-MailboxMessageConfiguration -identity "USER@EMAIL.HERE" @Param

# all Users
foreach ($user in (Get-mailbox -RecipientTypeDetails UserMailbox)) { Set-MailboxMessageConfiguration -identity $user.userprincipalname @Param }