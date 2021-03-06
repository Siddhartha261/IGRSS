﻿//The following code was generated by Microsoft Visual Studio 2005
// The test owner should check each test for validity.
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;
using System.Text;
using System.Collections.Generic;
using IGRSS.BusinessLogicLayer;
using IGRSS.BusinessObjects;
using System.Data;
using IGRSS.DataAccessLayer;
namespace IgrssTest
{
    /// <summary>
    ///This is a test class for IGRSS.BusinessLogicLayer.AppealApplication and is intended
    ///to contain all IGRSS.BusinessLogicLayer.AppealApplication Unit Tests
    ///</summary>
    [TestClass()]
    public class AppealApplicationTest
    {


        private TestContext testContextInstance;

        /// <summary>
        ///Gets or sets the test context which provides
        ///information about and functionality for the current test run.
        ///</summary>
        public TestContext TestContext
        {
            get
            {
                return testContextInstance;
            }
            set
            {
                testContextInstance = value;
            }
        }
        #region Additional test attributes
        // 
        //You can use the following additional attributes as you write your tests:
        //
        //Use ClassInitialize to run code before running the first test in the class
        //
        //[ClassInitialize()]
        //public static void MyClassInitialize(TestContext testContext)
        //{
        //}
        //
        //Use ClassCleanup to run code after all tests in a class have run
        //
        //[ClassCleanup()]
        //public static void MyClassCleanup()
        //{
        //}
        //
        //Use TestInitialize to run code before running each test
        //
        //[TestInitialize()]
        //public void MyTestInitialize()
        //{
        //}
        //
        //Use TestCleanup to run code after each test has run
        //
        //[TestCleanup()]
        //public void MyTestCleanup()
        //{
        //}
        //
        #endregion


        /// <summary>
        ///A test for AddAppealAplication (FormViewParameter, DataTable)
        ///</summary>
        [TestMethod()]
        public void AddAppealAplicationTest()
        {
            IGRSS.BusinessLogicLayer.AppealApplication target = new IGRSS.BusinessLogicLayer.AppealApplication();
            FormViewParameter Parameter = new FormViewParameter();
            IGRSS.DataAccessLayer.Appeal.AppealApplicationDataTable dt = new IGRSS.DataAccessLayer.Appeal.AppealApplicationDataTable();
            DataRow dr = dt.NewRow();
            dr["AppealApplicationId"] = new Guid();
            dr["AppealPrefix"] = "YSL";
            dr["AppealSlNo"]="22210";
            dr["AppealYear"]=2006;
            dr["OfficeId"]=new Guid("514ba1d5-61fb-4b9d-abfd-0dff857ca05d");
            dr["RegistrationNo"]="324444";
            dr["ApplicantName"]="BASKAR";
            dr["Address"]="Chennai";
            dr["TypeOfAppeal"]=2;
            dr["CalculatedAmount"]=500;
            dr["DepositAmount"] = 200;
            dr["FeeReceiptNo"]="467";
            dr["Amount"]="500";
            dr["InwardDate"]=DateTime.Now;
            dr["IsPaidAppealFee"]=true;
            dr["AppealInTime"]=true;
            dr["PaperFromTo"]="ssss";
            dr["CourtFeeTicket"]=true;
            dr["AppealRemarks"]="short listed";
            dr["CreatedBy"] = "sahu";
            dr["DocumentNo"]="3333";
            dr["OriginalSRO"] = new Guid("916fd082-061a-45fb-91a4-33967243b4cf");
            dr["DocumentDate"] = DateTime.Now;
            dt.Rows.Add(dr);
            Parameter.Values = dt.Rows[0];
            DataTable dtAct = new DataTable();
            dtAct.Columns.Add("ActId", typeof(Guid));
            dtAct.Columns.Add("Checked", typeof(bool));
            DataRow actDR;
            actDR = dtAct.NewRow();
            actDR["ActId"] = new Guid("eee9b625-be85-4715-920b-3ed6ec0f4470");
            actDR["Checked"] = true;
            dtAct.Rows.Add(actDR);
            target.AddAppealAplication(Parameter, dtAct);
            bool expected = true;
            Assert.AreEqual(expected,target.AddAppealAplication(Parameter, dtAct), "IGRSS.BusinessLogicLayer.Leave.AddLeaveDetails did not return the expected value." +
                    "");
          }

       

        /// <summary>
        ///A test for ApproveAppealApplication (Guid, Guid)
        ///</summary>
        [TestMethod()]
        public void ApproveAppealApplicationTest()
        {
            IGRSS.BusinessLogicLayer.AppealApplication target = new IGRSS.BusinessLogicLayer.AppealApplication();
            Guid AppealApplicationId = new Guid("2a0e5867-5da4-487f-824e-0272073bcf3b"); // TODO: Initialize to an appropriate value
            Guid AlertId = new Guid("bf1d42ed-7c1b-4878-8536-45270afba6df"); // TODO: Initialize to an appropriate value
            Assert.AreEqual(true, target.ApproveAppealApplication(AppealApplicationId, AlertId), "IGRSS.BusinessLogicLayer.Leave.AddLeaveDetails did not return the expected value." +
                    "");
        }
        /// <summary>
        ///A test for GetAllAppealApplication ()
        ///</summary>
        [TestMethod()]
        public void GetAllAppealApplicationTest()
        {
            IGRSS.BusinessLogicLayer.AppealApplication target = new IGRSS.BusinessLogicLayer.AppealApplication();
          
            Assert.IsInstanceOfType(target.GetAllAppealApplication(),typeof(IGRSS.DataAccessLayer.Appeal.AppealApplicationDataTable),"IGRSS.BusinessLogicLayer.AppealApplication.GetAllAppealApplication did not return");
            
        }
        /// <summary>
        ///A test for GetAppealApplicationByAppealID (Guid)
        ///</summary>
        [TestMethod()]
        public void GetAppealApplicationByAppealIDTest()
        {
            IGRSS.BusinessLogicLayer.AppealApplication target = new IGRSS.BusinessLogicLayer.AppealApplication();
            Guid AppealApplicationId = new Guid("0b109896-2fd1-4369-90fa-d77039f0e3be"); // TODO: Initialize to an appropriate value
            Assert.IsInstanceOfType(target.GetAppealApplicationByAppealID(AppealApplicationId), typeof(IGRSS.DataAccessLayer.Appeal.AppealApplicationDataTable), "IGRSS.BusinessLogicLayer.Appeal.AppealApplicationDataTable return wrong type of data");
        }
          /// <summary>
        ///A test for GetAppealApplicationByAppealNo (decimal)
        ///</summary>
        [TestMethod()]
        public void GetAppealApplicationByAppealNoTest()
        {
            IGRSS.BusinessLogicLayer.AppealApplication target = new IGRSS.BusinessLogicLayer.AppealApplication();
            int AppealSlNo =12312; // TODO: Initialize to an appropriate value
            Assert.IsInstanceOfType(target.GetAppealApplicationByAppealNo(AppealSlNo), typeof(IGRSS.DataAccessLayer.Appeal.AppealApplicationDataTable), "IGRSS.BusinessLogicLayer.Appeal.AppealApplicationDataTable return wrong type of data");
 
        }

        /// <summary>
        ///A test for GetAppealApplicationByApplicantName (string)
        ///</summary>
        [TestMethod()]
        public void GetAppealApplicationByApplicantNameTest()
        {
            IGRSS.BusinessLogicLayer.AppealApplication target = new IGRSS.BusinessLogicLayer.AppealApplication();
            string ApplicantName = null; // TODO: Initialize to an appropriate value
            Assert.IsInstanceOfType(target.GetAppealApplicationByApplicantName(ApplicantName), typeof(IGRSS.DataAccessLayer.Appeal.AppealApplicationDataTable), "IGRSS.BusinessLogicLayer.Appeal.AppealApplicationDataTable return wrong type of data");
        }

        /// <summary>
        ///A test for GetAppealStatusByAppealNo (decimal)
        ///</summary>
        [TestMethod()]
        public void GetAppealStatusByAppealNoTest()
        {
            IGRSS.BusinessLogicLayer.AppealApplication target = new IGRSS.BusinessLogicLayer.AppealApplication();
            int AppealSlNo = 12312; // TODO: Initialize to an appropriate value
            Assert.IsInstanceOfType(target.GetAppealStatusByAppealNo(AppealSlNo), typeof(IGRSS.DataAccessLayer.Appeal.AppealApplicationDataTable), "IGRSS.BusinessLogicLayer.Appeal.AppealApplicationDataTable return wrong type of data");
         }
         /// <summary>
        ///A test for RejectAppealApplication (Guid)
        ///</summary>
        [TestMethod()]
        public void RejectAppealApplicationTest()
        {
            IGRSS.BusinessLogicLayer.AppealApplication target = new IGRSS.BusinessLogicLayer.AppealApplication();
            Guid AppealApplicationId = new Guid("f1807bab-c560-4807-a382-1befbb368d5f"); // TODO: Initialize to an appropriate value
            Assert.AreEqual(true,target.RejectAppealApplication(AppealApplicationId), "IGRSS.BusinessLogicLayer.Leave.AddLeaveDetails did not return the expected value." +
                    "");
        }

        /// <summary>
        ///A test for UpdateAppealAplication (FormViewParameter, DataTable, Guid, Guid, bool)
        ///</summary>
        [TestMethod()]
        public void UpdateAppealAplicationTest()
        {
            IGRSS.BusinessLogicLayer.AppealApplication target = new IGRSS.BusinessLogicLayer.AppealApplication();
            FormViewParameter Parameter = new FormViewParameter();
            IGRSS.DataAccessLayer.Appeal.AppealApplicationDataTable dt = new IGRSS.DataAccessLayer.Appeal.AppealApplicationDataTable();
            DataRow dr = dt.NewRow();
            Guid AppealId = new Guid("2a0e5867-5da4-487f-824e-0272073bcf3b");
            dr["AppealApplicationId"] = new Guid("2a0e5867-5da4-487f-824e-0272073bcf3b");
            dr["AppealPrefix"] = "YSD";
            dr["AppealSlNo"] = "22210";
            dr["AppealYear"] = 2006;
            dr["OfficeId"] = new Guid("514ba1d5-61fb-4b9d-abfd-0dff857ca05d");
            dr["RegistrationNo"] = "324444";
            dr["ApplicantName"] = "BASKAR";
            dr["Address"] = "Chennai";
            dr["TypeOfAppeal"] = 2;
            dr["CalculatedAmount"] = 500;
            dr["DepositAmount"] = 200;
            dr["FeeReceiptNo"] = "467";
            dr["Amount"] = "500";
            dr["InwardDate"] = DateTime.Now;
            dr["IsPaidAppealFee"] = true;
            dr["AppealInTime"] = true;
            dr["PaperFromTo"] = "ssss";
            dr["CourtFeeTicket"] = true;
            dr["AppealRemarks"] = "short listed";
            dr["ModifiedBy"] ="sahu";
            dr["ModifiedBy"] = DateTime.Now;
            dr["DocumentNo"] = "3333";
            dr["OriginalSRO"] = new Guid("916fd082-061a-45fb-91a4-33967243b4cf");
            dr["DocumentDate"] = DateTime.Now;
            dt.Rows.Add(dr);
            Parameter.Values = dt.Rows[0];
            DataTable dtAct = new DataTable();
            dtAct.Columns.Add("ActId", typeof(Guid));
            dtAct.Columns.Add("Checked", typeof(bool));
            DataRow actDR;
            actDR = dtAct.NewRow();
            actDR["ActId"] = new Guid("eee9b625-be85-4715-920b-3ed6ec0f4470");
            actDR["Checked"] = true;
            dtAct.Rows.Add(actDR);
            target.AddAppealAplication(Parameter, dtAct);
            bool expected = true;
            Guid AlertId = new Guid("bf1d42ed-7c1b-4878-8536-45270afba6df");
            Assert.AreEqual(expected, target.UpdateAppealAplication(Parameter, dtAct, AppealId, AlertId, true), "IGRSS.BusinessLogicLayer.Leave.AddLeaveDetails did not return the expected value." +
                    "");
            
          
        }

    }


}
