/// <summary>
/// Codeunit KNH Dictionary (ID 50100).
/// </summary>
codeunit 50500 KNHDictionary
{
    trigger OnRun()
    begin
        GetItemDict();
    end;

    var
        ItemDictionary: Dictionary of [Code[20], Dictionary of [Integer, Text]];
        DetailItemDict: Dictionary of [Integer, Text];

    //Dictionary within Dictionary
    local procedure GetItemDict()
    var
        Item: Record Item;
    begin
        if Item.FindFirst() then begin
            DetailItemDict.Add(1, Item.Description);
            DetailItemDict.Add(2, Item."Base Unit of Measure");
            DetailItemDict.Add(3, Format(Item."Unit Price"));
            ItemDictionary.Add(Item."No.", DetailItemDict);
            //Clear(DetailItemDict);
        end;
        GetDictValues();
    end;

    /// <summary>
    /// GetDictValues.
    /// </summary>
    local procedure GetDictValues()
    var
        Detail: Text;
        ItemNo: Code[20];
        I: Integer;
    begin
        I := 1;
        foreach DetailItemDict in ItemDictionary.Values() do begin
            foreach Detail in DetailItemDict.Values() do begin
                ItemDictionary.Keys.Get(I, ItemNo);
                Message(Format(ItemNo) + ':' + Detail);
            end;
            I += 1;
        end;
    end;
}
