


/* ����3.4�İ汾ʱʹ��5.0�ĽŲ��������������ڽ��лָ���*/
USE QPTreasureDB

IF EXISTS (SELECT 1 FROM sys.columns WHERE object_id=OBJECT_ID('OnLineOrder') AND name='ThreeOrderNo')
BEGIN
 ALTER TABLE OnLineOrder DROP COLUMN ThreeOrderNo
 ALTER TABLE OnLineOrder DROP COLUMN Remark
END

GO







/* ����3.3�İ汾ʱʹ��5.0�ĽŲ��������������ڽ��лָ���*/
USE QPTreasureDB

IF EXISTS (SELECT 1 FROM sys.columns WHERE object_id=OBJECT_ID('Prize') AND name='PriceType')
BEGIN
 ALTER TABLE Prize DROP COLUMN PriceType
END

GO
