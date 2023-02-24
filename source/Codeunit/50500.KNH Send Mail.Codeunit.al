/// <summary>
/// Codeunit KNH KNH KNH KNH KNH Send Mail (ID 50100).
/// </summary>
codeunit 50500 "Send Mail"
{
    /// <summary>
    /// SendMail.
    /// </summary>
    /// <param name="Customer">Record Customer.</param>
    procedure SendMail(Customer: Record Customer)
    var
        CustomerNo: Code[20];
        CustDictionary: Dictionary of [Code[20], Code[20]];
    begin
        CustDictionary := GetCustDictionary(Customer); //Get CustNo from CustDic and place in CustDic
        foreach CustomerNo in CustDictionary.keys() do
            SendMailToCust(CustomerNo);
    end;

    local procedure GetCustDictionary(Customer: Record Customer): Dictionary of [Code[20], Code[20]]
    var
        CustDictionary: Dictionary of [Code[20], Code[20]];
    begin
        if Customer.Findset() then
            repeat
                if CustDictionary.Add(Customer."No.", Customer."No.") then;
            until Customer.Next() = 0;
        exit(CustDictionary);
    end;

    local procedure GetItemDict(): Dictionary of [Code[20], Dictionary of [Integer, Text]]
    var
        Item: Record Item;
        ItemDictionary: Dictionary of [Code[20], Dictionary of [Integer, Text]];
        DetailItemDict: Dictionary of [Integer, Text];
    begin
        if Item.FindSet() then
            repeat
                DetailItemDict.Add(1, Item.Description);
                DetailItemDict.Add(2, Item."Base Unit of Measure");
                DetailItemDict.Add(3, format(Item."Unit Price"));
                ItemDictionary.Add(Item."No.", DetailItemDict);
                Clear(DetailItemDict);
            until Item.Next() = 0;
        exit(ItemDictionary);
    end;

    local procedure SendMailToCust(pCustomerNo: Code[20]);
    begin
        pCustomerNo := pCustomerNo;
    end;

    /// <summary>
    /// GetDictValues.
    /// </summary>
    procedure GetDictValues()
    var
        ItemDict: Dictionary of [Code[20], Dictionary of [Integer, Text]];
        Dict: Dictionary of [Integer, Text];
        Detail: Text;
        ItemNo: Code[20];
        i: Integer;
    begin
        GetItemDict();
        i := 1;
        foreach Dict in ItemDict.Values() do begin
            foreach Detail in Dict.Values() do begin
                ItemDict.Keys.Get(i, ItemNo);
                Message(Format(ItemNo) + ':' + Detail);
            end;
            i += 1;
        end;
    end;
}
