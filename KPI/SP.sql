--Calculates investment value of a specifies borekerage firm, if no firm is given, show all
create proc sp_Investment_value @Firm  varchar(50) = null
as
	if @Firm is not null	
		begin 
			select BrokerageFirm, sum(currentvalue) as CurrentTotalInvestmentValue
			from Investments_Treasury.StockTradingAccounts
			where BrokerageFirm = trim(@Firm)
			group by BrokerageFirm
		end
	else
		begin
			select BrokerageFirm, sum(currentvalue) as CurrentTotalInvestmentValue
			from Investments_Treasury.StockTradingAccounts
			group by BrokerageFirm
		end

exec sp_Investment_value 'Tinkoff'
