﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.269
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

// 
// This source code was auto-generated by Microsoft.VSDesigner, Version 4.0.30319.269.
// 
#pragma warning disable 1591

namespace IGRSS.SdcService {
    using System;
    using System.Web.Services;
    using System.Diagnostics;
    using System.Web.Services.Protocols;
    using System.ComponentModel;
    using System.Xml.Serialization;
    
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Web.Services", "4.0.30319.1")]
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Web.Services.WebServiceBindingAttribute(Name="StampDutyCalculatorSoap", Namespace="http://tempuri.org/")]
    public partial class StampDutyCalculator : System.Web.Services.Protocols.SoapHttpClientProtocol {
        
        private System.Threading.SendOrPostCallback GetStampDutyCalculationOperationCompleted;
        
        private bool useDefaultCredentialsSetExplicitly;
        
        /// <remarks/>
        public StampDutyCalculator() {
            this.Url = global::IGRSS.Properties.Settings.Default.BusinessLayer_SdcService_StampDutyCalculator;
            if ((this.IsLocalFileSystemWebService(this.Url) == true)) {
                this.UseDefaultCredentials = true;
                this.useDefaultCredentialsSetExplicitly = false;
            }
            else {
                this.useDefaultCredentialsSetExplicitly = true;
            }
        }
        
        public new string Url {
            get {
                return base.Url;
            }
            set {
                if ((((this.IsLocalFileSystemWebService(base.Url) == true) 
                            && (this.useDefaultCredentialsSetExplicitly == false)) 
                            && (this.IsLocalFileSystemWebService(value) == false))) {
                    base.UseDefaultCredentials = false;
                }
                base.Url = value;
            }
        }
        
        public new bool UseDefaultCredentials {
            get {
                return base.UseDefaultCredentials;
            }
            set {
                base.UseDefaultCredentials = value;
                this.useDefaultCredentialsSetExplicitly = true;
            }
        }
        
        /// <remarks/>
        public event GetStampDutyCalculationCompletedEventHandler GetStampDutyCalculationCompleted;
        
        /// <remarks/>
        [System.Web.Services.Protocols.SoapDocumentMethodAttribute("http://tempuri.org/GetStampDutyCalculation", RequestNamespace="http://tempuri.org/", ResponseNamespace="http://tempuri.org/", Use=System.Web.Services.Description.SoapBindingUse.Literal, ParameterStyle=System.Web.Services.Protocols.SoapParameterStyle.Wrapped)]
        public ValuationResult GetStampDutyCalculation(ValuationRequest Request) {
            object[] results = this.Invoke("GetStampDutyCalculation", new object[] {
                        Request});
            return ((ValuationResult)(results[0]));
        }
        
        /// <remarks/>
        public void GetStampDutyCalculationAsync(ValuationRequest Request) {
            this.GetStampDutyCalculationAsync(Request, null);
        }
        
        /// <remarks/>
        public void GetStampDutyCalculationAsync(ValuationRequest Request, object userState) {
            if ((this.GetStampDutyCalculationOperationCompleted == null)) {
                this.GetStampDutyCalculationOperationCompleted = new System.Threading.SendOrPostCallback(this.OnGetStampDutyCalculationOperationCompleted);
            }
            this.InvokeAsync("GetStampDutyCalculation", new object[] {
                        Request}, this.GetStampDutyCalculationOperationCompleted, userState);
        }
        
        private void OnGetStampDutyCalculationOperationCompleted(object arg) {
            if ((this.GetStampDutyCalculationCompleted != null)) {
                System.Web.Services.Protocols.InvokeCompletedEventArgs invokeArgs = ((System.Web.Services.Protocols.InvokeCompletedEventArgs)(arg));
                this.GetStampDutyCalculationCompleted(this, new GetStampDutyCalculationCompletedEventArgs(invokeArgs.Results, invokeArgs.Error, invokeArgs.Cancelled, invokeArgs.UserState));
            }
        }
        
        /// <remarks/>
        public new void CancelAsync(object userState) {
            base.CancelAsync(userState);
        }
        
        private bool IsLocalFileSystemWebService(string url) {
            if (((url == null) 
                        || (url == string.Empty))) {
                return false;
            }
            System.Uri wsUri = new System.Uri(url);
            if (((wsUri.Port >= 1024) 
                        && (string.Compare(wsUri.Host, "localHost", System.StringComparison.OrdinalIgnoreCase) == 0))) {
                return true;
            }
            return false;
        }
    }
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Xml", "4.0.30319.233")]
    [System.SerializableAttribute()]
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Xml.Serialization.XmlTypeAttribute(Namespace="http://tempuri.org/")]
    public partial class ValuationRequest {
        
        private System.Guid valuationIdField;
        
        private System.Guid adjudicationIdField;
        
        private int districtCodeField;
        
        private int talukaCodeField;
        
        private int villageCodeField;
        
        private string schemeTypeField;
        
        private decimal estimatedPriceField;
        
        private bool isConstructedPropertyField;
        
        private string schemeNoField;
        
        private string plotNoField;
        
        private decimal areaOfPlotField;
        
        private decimal areaOfConstructionField;
        
        private string typeOfLandField;
        
        private decimal internalElectrificationRateField;
        
        private decimal developmentRateField;
        
        private decimal otherFeeRateField;
        
        private int yearOfConstructionField;
        
        private decimal specialDeductionRateField;
        
        private decimal liftExpenseField;
        
        /// <remarks/>
        public System.Guid ValuationId {
            get {
                return this.valuationIdField;
            }
            set {
                this.valuationIdField = value;
            }
        }
        
        /// <remarks/>
        public System.Guid AdjudicationId {
            get {
                return this.adjudicationIdField;
            }
            set {
                this.adjudicationIdField = value;
            }
        }
        
        /// <remarks/>
        public int DistrictCode {
            get {
                return this.districtCodeField;
            }
            set {
                this.districtCodeField = value;
            }
        }
        
        /// <remarks/>
        public int TalukaCode {
            get {
                return this.talukaCodeField;
            }
            set {
                this.talukaCodeField = value;
            }
        }
        
        /// <remarks/>
        public int VillageCode {
            get {
                return this.villageCodeField;
            }
            set {
                this.villageCodeField = value;
            }
        }
        
        /// <remarks/>
        public string SchemeType {
            get {
                return this.schemeTypeField;
            }
            set {
                this.schemeTypeField = value;
            }
        }
        
        /// <remarks/>
        public decimal EstimatedPrice {
            get {
                return this.estimatedPriceField;
            }
            set {
                this.estimatedPriceField = value;
            }
        }
        
        /// <remarks/>
        public bool IsConstructedProperty {
            get {
                return this.isConstructedPropertyField;
            }
            set {
                this.isConstructedPropertyField = value;
            }
        }
        
        /// <remarks/>
        public string SchemeNo {
            get {
                return this.schemeNoField;
            }
            set {
                this.schemeNoField = value;
            }
        }
        
        /// <remarks/>
        public string PlotNo {
            get {
                return this.plotNoField;
            }
            set {
                this.plotNoField = value;
            }
        }
        
        /// <remarks/>
        public decimal AreaOfPlot {
            get {
                return this.areaOfPlotField;
            }
            set {
                this.areaOfPlotField = value;
            }
        }
        
        /// <remarks/>
        public decimal AreaOfConstruction {
            get {
                return this.areaOfConstructionField;
            }
            set {
                this.areaOfConstructionField = value;
            }
        }
        
        /// <remarks/>
        public string TypeOfLand {
            get {
                return this.typeOfLandField;
            }
            set {
                this.typeOfLandField = value;
            }
        }
        
        /// <remarks/>
        public decimal InternalElectrificationRate {
            get {
                return this.internalElectrificationRateField;
            }
            set {
                this.internalElectrificationRateField = value;
            }
        }
        
        /// <remarks/>
        public decimal DevelopmentRate {
            get {
                return this.developmentRateField;
            }
            set {
                this.developmentRateField = value;
            }
        }
        
        /// <remarks/>
        public decimal OtherFeeRate {
            get {
                return this.otherFeeRateField;
            }
            set {
                this.otherFeeRateField = value;
            }
        }
        
        /// <remarks/>
        public int YearOfConstruction {
            get {
                return this.yearOfConstructionField;
            }
            set {
                this.yearOfConstructionField = value;
            }
        }
        
        /// <remarks/>
        public decimal SpecialDeductionRate {
            get {
                return this.specialDeductionRateField;
            }
            set {
                this.specialDeductionRateField = value;
            }
        }
        
        /// <remarks/>
        public decimal LiftExpense {
            get {
                return this.liftExpenseField;
            }
            set {
                this.liftExpenseField = value;
            }
        }
    }
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Xml", "4.0.30319.233")]
    [System.SerializableAttribute()]
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Xml.Serialization.XmlTypeAttribute(Namespace="http://tempuri.org/")]
    public partial class ValuationResult {
        
        private System.DateTime m_ValuationDateField;
        
        private System.Guid valuationIdField;
        
        private System.Guid adjudicationIdField;
        
        private int districtCodeField;
        
        private int talukaCodeField;
        
        private int villageCodeField;
        
        private string schemeTypeField;
        
        private decimal estimatedPriceField;
        
        private bool isConstructedPropertyField;
        
        private string schemeNoField;
        
        private string plotNoField;
        
        private decimal areaOfPlotField;
        
        private decimal areaOfConstructionField;
        
        private string typeOfLandField;
        
        private decimal internalElectrificationRateField;
        
        private decimal developmentRateField;
        
        private decimal otherFeeRateField;
        
        private int yearOfConstructionField;
        
        private decimal specialDeductionRateField;
        
        private decimal liftExpenseField;
        
        private decimal landRateField;
        
        private decimal valueOfLandField;
        
        private decimal internalElectrificationExpenseField;
        
        private decimal developmentExpenseField;
        
        private decimal otherFeesField;
        
        private decimal specialDeductionField;
        
        private System.DateTime valuationDateField;
        
        private decimal estimatedPriceOfConstructionField;
        
        private decimal lifeOfConstructionField;
        
        private decimal depreciationField;
        
        private decimal netPriceField;
        
        private decimal valueOfConstructionField;
        
        private decimal valuationOfConstructionField;
        
        private string remarksField;
        
        private decimal stampDutyField;
        
        private decimal stampDutyRateField;
        
        /// <remarks/>
        public System.DateTime m_ValuationDate {
            get {
                return this.m_ValuationDateField;
            }
            set {
                this.m_ValuationDateField = value;
            }
        }
        
        /// <remarks/>
        public System.Guid ValuationId {
            get {
                return this.valuationIdField;
            }
            set {
                this.valuationIdField = value;
            }
        }
        
        /// <remarks/>
        public System.Guid AdjudicationId {
            get {
                return this.adjudicationIdField;
            }
            set {
                this.adjudicationIdField = value;
            }
        }
        
        /// <remarks/>
        public int DistrictCode {
            get {
                return this.districtCodeField;
            }
            set {
                this.districtCodeField = value;
            }
        }
        
        /// <remarks/>
        public int TalukaCode {
            get {
                return this.talukaCodeField;
            }
            set {
                this.talukaCodeField = value;
            }
        }
        
        /// <remarks/>
        public int VillageCode {
            get {
                return this.villageCodeField;
            }
            set {
                this.villageCodeField = value;
            }
        }
        
        /// <remarks/>
        public string SchemeType {
            get {
                return this.schemeTypeField;
            }
            set {
                this.schemeTypeField = value;
            }
        }
        
        /// <remarks/>
        public decimal EstimatedPrice {
            get {
                return this.estimatedPriceField;
            }
            set {
                this.estimatedPriceField = value;
            }
        }
        
        /// <remarks/>
        public bool IsConstructedProperty {
            get {
                return this.isConstructedPropertyField;
            }
            set {
                this.isConstructedPropertyField = value;
            }
        }
        
        /// <remarks/>
        public string SchemeNo {
            get {
                return this.schemeNoField;
            }
            set {
                this.schemeNoField = value;
            }
        }
        
        /// <remarks/>
        public string PlotNo {
            get {
                return this.plotNoField;
            }
            set {
                this.plotNoField = value;
            }
        }
        
        /// <remarks/>
        public decimal AreaOfPlot {
            get {
                return this.areaOfPlotField;
            }
            set {
                this.areaOfPlotField = value;
            }
        }
        
        /// <remarks/>
        public decimal AreaOfConstruction {
            get {
                return this.areaOfConstructionField;
            }
            set {
                this.areaOfConstructionField = value;
            }
        }
        
        /// <remarks/>
        public string TypeOfLand {
            get {
                return this.typeOfLandField;
            }
            set {
                this.typeOfLandField = value;
            }
        }
        
        /// <remarks/>
        public decimal InternalElectrificationRate {
            get {
                return this.internalElectrificationRateField;
            }
            set {
                this.internalElectrificationRateField = value;
            }
        }
        
        /// <remarks/>
        public decimal DevelopmentRate {
            get {
                return this.developmentRateField;
            }
            set {
                this.developmentRateField = value;
            }
        }
        
        /// <remarks/>
        public decimal OtherFeeRate {
            get {
                return this.otherFeeRateField;
            }
            set {
                this.otherFeeRateField = value;
            }
        }
        
        /// <remarks/>
        public int YearOfConstruction {
            get {
                return this.yearOfConstructionField;
            }
            set {
                this.yearOfConstructionField = value;
            }
        }
        
        /// <remarks/>
        public decimal SpecialDeductionRate {
            get {
                return this.specialDeductionRateField;
            }
            set {
                this.specialDeductionRateField = value;
            }
        }
        
        /// <remarks/>
        public decimal LiftExpense {
            get {
                return this.liftExpenseField;
            }
            set {
                this.liftExpenseField = value;
            }
        }
        
        /// <remarks/>
        public decimal LandRate {
            get {
                return this.landRateField;
            }
            set {
                this.landRateField = value;
            }
        }
        
        /// <remarks/>
        public decimal ValueOfLand {
            get {
                return this.valueOfLandField;
            }
            set {
                this.valueOfLandField = value;
            }
        }
        
        /// <remarks/>
        public decimal InternalElectrificationExpense {
            get {
                return this.internalElectrificationExpenseField;
            }
            set {
                this.internalElectrificationExpenseField = value;
            }
        }
        
        /// <remarks/>
        public decimal DevelopmentExpense {
            get {
                return this.developmentExpenseField;
            }
            set {
                this.developmentExpenseField = value;
            }
        }
        
        /// <remarks/>
        public decimal OtherFees {
            get {
                return this.otherFeesField;
            }
            set {
                this.otherFeesField = value;
            }
        }
        
        /// <remarks/>
        public decimal SpecialDeduction {
            get {
                return this.specialDeductionField;
            }
            set {
                this.specialDeductionField = value;
            }
        }
        
        /// <remarks/>
        public System.DateTime ValuationDate {
            get {
                return this.valuationDateField;
            }
            set {
                this.valuationDateField = value;
            }
        }
        
        /// <remarks/>
        public decimal EstimatedPriceOfConstruction {
            get {
                return this.estimatedPriceOfConstructionField;
            }
            set {
                this.estimatedPriceOfConstructionField = value;
            }
        }
        
        /// <remarks/>
        public decimal LifeOfConstruction {
            get {
                return this.lifeOfConstructionField;
            }
            set {
                this.lifeOfConstructionField = value;
            }
        }
        
        /// <remarks/>
        public decimal Depreciation {
            get {
                return this.depreciationField;
            }
            set {
                this.depreciationField = value;
            }
        }
        
        /// <remarks/>
        public decimal NetPrice {
            get {
                return this.netPriceField;
            }
            set {
                this.netPriceField = value;
            }
        }
        
        /// <remarks/>
        public decimal ValueOfConstruction {
            get {
                return this.valueOfConstructionField;
            }
            set {
                this.valueOfConstructionField = value;
            }
        }
        
        /// <remarks/>
        public decimal ValuationOfConstruction {
            get {
                return this.valuationOfConstructionField;
            }
            set {
                this.valuationOfConstructionField = value;
            }
        }
        
        /// <remarks/>
        public string Remarks {
            get {
                return this.remarksField;
            }
            set {
                this.remarksField = value;
            }
        }
        
        /// <remarks/>
        public decimal StampDuty {
            get {
                return this.stampDutyField;
            }
            set {
                this.stampDutyField = value;
            }
        }
        
        /// <remarks/>
        public decimal StampDutyRate {
            get {
                return this.stampDutyRateField;
            }
            set {
                this.stampDutyRateField = value;
            }
        }
    }
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Web.Services", "4.0.30319.1")]
    public delegate void GetStampDutyCalculationCompletedEventHandler(object sender, GetStampDutyCalculationCompletedEventArgs e);
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Web.Services", "4.0.30319.1")]
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    public partial class GetStampDutyCalculationCompletedEventArgs : System.ComponentModel.AsyncCompletedEventArgs {
        
        private object[] results;
        
        internal GetStampDutyCalculationCompletedEventArgs(object[] results, System.Exception exception, bool cancelled, object userState) : 
                base(exception, cancelled, userState) {
            this.results = results;
        }
        
        /// <remarks/>
        public ValuationResult Result {
            get {
                this.RaiseExceptionIfNecessary();
                return ((ValuationResult)(this.results[0]));
            }
        }
    }
}

#pragma warning restore 1591