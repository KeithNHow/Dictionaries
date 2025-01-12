/// <summary>
/// Codeunit KNH Dictionary (ID 50100).
/// </summary>
codeunit 50500 KNHDictionary
{
    trigger OnRun()
    begin
        this.GetItemDict();
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
            this.DetailItemDict.Add(1, Item.Description);
            this.DetailItemDict.Add(2, Item."Base Unit of Measure");
            this.DetailItemDict.Add(3, Format(Item."Unit Price"));
            this.ItemDictionary.Add(Item."No.", this.DetailItemDict);
            //Clear(this.DetailItemDict);
        end;
        this.GetDictValues();
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
        foreach DetailItemDict in this.ItemDictionary.Values() do begin
            foreach Detail in this.DetailItemDict.Values() do begin
                this.ItemDictionary.Keys.Get(I, ItemNo);
                Message(Format(ItemNo) + ':' + Detail);
            end;
            I += 1;
        end;
    end;
}
