


/* 升级3.4的版本时使用5.0的脚步进行升级，现在进行恢复。*/
USE QPTreasureDB

IF EXISTS (SELECT 1 FROM sys.columns WHERE object_id=OBJECT_ID('OnLineOrder') AND name='ThreeOrderNo')
BEGIN
 ALTER TABLE OnLineOrder DROP COLUMN ThreeOrderNo
 ALTER TABLE OnLineOrder DROP COLUMN Remark
END

GO







/* 升级3.3的版本时使用5.0的脚步进行升级，现在进行恢复。*/
USE QPTreasureDB

IF EXISTS (SELECT 1 FROM sys.columns WHERE object_id=OBJECT_ID('Prize') AND name='PriceType')
BEGIN
 ALTER TABLE Prize DROP COLUMN PriceType
END

GO
