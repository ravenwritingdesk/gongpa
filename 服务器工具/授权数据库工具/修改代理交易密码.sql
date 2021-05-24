declare @accountName varchar(50)
declare @MemberID int

----修改代理的交易密码
--填会员账号
set @accountName='92fox'
--填会员ID
set @MemberID=1

UPDATE [QPAccountsDB].[dbo].[AccountsInfo]
   SET [InsurePass] = [LogonPass] WHERE [Accounts]=@accountName and UserID=@MemberID

UPDATE [QPProxyDB].[dbo].[BS_ProxyInfo]
   SET [BankPassword] = [password] WHERE account=@accountName and ProxyID=@MemberID
GO




