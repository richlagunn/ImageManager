//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ImageManagerData
{
    using System;
    
    public partial class AuditTrail
    {
        public AuditTrail()
        {
            this.MetaUpdated = new UpdatedAudit();
            this.MetaCreated = new CreatedAudit();
        }
    
    
        public UpdatedAudit MetaUpdated { get; set; }
        public CreatedAudit MetaCreated { get; set; }
    }
}
