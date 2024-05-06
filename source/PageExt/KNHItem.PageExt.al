pageextension 50500 KNHItem extends "Item List"
{
    actions
    {
        addbefore(Reports)
        {
            group(Special)
            {
                action(Dictionary)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Dictionary';
                    Image = OutputJournal;
                    ToolTip = 'Dictionary Demo';
                    Promoted = true;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    PromotedCategory = Category11;
                    RunObject = codeunit KNHDictionary;
                }
            }
        }
    }
}
