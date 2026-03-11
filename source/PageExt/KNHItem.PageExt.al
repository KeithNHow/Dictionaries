/// <summary>
/// Page Extension has an action that runs codeunit KNH Dictionary which demonstrates a dictionary within a dictionary.
/// </summary>
pageextension 50500 KNHItem extends "Item List"
{
    actions
    {
        addbefore(Reports)
        {
            group(KNHSpecial)
            {
                action(KNHDictionary)
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
