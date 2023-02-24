/// <summary>
/// Permissions "KNH Dictionaries" (ID 50500).
/// </summary>
permissionset 50500 Dictionaries
{
    Assignable = true;
    Caption = 'Dictionaries', MaxLength = 30;
    Permissions =
        codeunit "Send Mail" = X;
}
