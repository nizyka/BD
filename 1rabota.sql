create trigger ad_asDd on dbo.issing_books
for insert 
as
declare @i_new INT;
Select @i_new = i_num from inserted;
declare @num_new INT;
Select @num_new = num from inserted;
declare @num_izd INT;
Select @num_izd = num_cop from dbo.izdanie
where  dbo.izdanie.i_num = @i_new;
if(@num_new>@num_izd)
Begin
Set nocount on;
rollback tran;
print 'недостаточное количество экземпляров'
end;