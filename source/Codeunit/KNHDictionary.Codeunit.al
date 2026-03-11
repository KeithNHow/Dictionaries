/// <summary>
/// Codeunit is called from the action on the page extension. It demonstrates a dictionary within a dictionary. The first dictionary has a key of Item No. and the value is another dictionary. The second dictionary has an integer key and text value which are the item details. The GetDictValues procedure loops through the dictionaries and displays the item details in a message box.
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
        end;
        this.GetDictValues();
    end;

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
