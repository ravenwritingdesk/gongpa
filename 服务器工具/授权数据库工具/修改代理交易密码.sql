declare @accountName varchar(50)
declare @MemberID int

----�޸Ĵ���Ľ�������
--���Ա�˺�
set @accountName='92fox'
--���ԱID
set @MemberID=1

UPDATE [QPAccountsDB].[dbo].[AccountsInfo]
   SET [InsurePass] = [LogonPass] WHERE [Accounts]=@accountName and UserID=@MemberID

UPDATE [QPProxyDB].[dbo].[BS_ProxyInfo]
   SET [BankPassword] = [password] WHERE account=@accountName and ProxyID=@MemberID
GO




