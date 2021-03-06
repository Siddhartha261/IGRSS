using System;
using System.Collections.Generic;
using System.Text;
using System.Workflow.Runtime;
using System.Workflow.ComponentModel;
using Utilities.Common;

namespace Utilities.WorkflowServices
{
	public class WorkflowResults
	{
		#region Properties

		private WorkflowStatus m_Status;
		public WorkflowStatus Status
		{
			get
			{
				return m_Status;
			}
			set
			{
				m_Status = value;
			}

		}

		private Dictionary<string, object> m_OutputParameters;
		public Dictionary<string, object> OutputParameters
		{
			get
			{
				return m_OutputParameters;
			}
			set
			{
				m_OutputParameters = value;
			}
		}

		private Guid m_InstanceId;
		public Guid InstanceId
		{
			get
			{
				return m_InstanceId;
			}
			set
			{
				m_InstanceId = value;
			}

		}

		private Activity m_WorkflowDefinition;
		public Activity WorkflowDefinition
		{
			get
			{
				return m_WorkflowDefinition;
			}
			set
			{
				m_WorkflowDefinition = value;
			}

		}

		private Exception m_Exception;
		public Exception Exception
		{
			get
			{
				return m_Exception;
			}
			set
			{
				m_Exception = value;
			}

		}

		#endregion

		#region Constructors

		private WorkflowResults(WorkflowCompletedEventArgs args)
		{
			Check.ArgumentIsNotNull(args, "args");
			OutputParameters = args.OutputParameters;
			InstanceId = args.WorkflowInstance.InstanceId;
			WorkflowDefinition = args.WorkflowDefinition;
		}

		private WorkflowResults(WorkflowTerminatedEventArgs args)
		{
			Check.ArgumentIsNotNull(args, "args");
			InstanceId = args.WorkflowInstance.InstanceId;
			Exception = args.Exception;
		}

		private WorkflowResults(WorkflowEventArgs args)
		{
			Check.ArgumentIsNotNull(args, "args");
			InstanceId = args.WorkflowInstance.InstanceId;
		}

		private WorkflowResults()
		{
		}

		#endregion

		#region Factory Methods

		public static WorkflowResults CreateCompletedWorkflowResults(WorkflowCompletedEventArgs args)
		{
			WorkflowResults results = new WorkflowResults(args);
			results.Status= WorkflowStatus.Completed;
			return results;
		}

		public static WorkflowResults CreateTerminatedWorkflowResults(WorkflowTerminatedEventArgs args)
		{
			WorkflowResults results = new WorkflowResults(args);
			results.Status = WorkflowStatus.Terminated;
			return results;
		}

		//public WorkflowResults CreateAbortedWorkflowResults(WorkflowEventArgs args)
		//{
		//    WorkflowResults results = new WorkflowResults(args);
		//    results.Status = WorkflowStatus.Aborted;
		//    return results;
		//}

		public static WorkflowResults CreateRunningWorkflowResults(WorkflowEventArgs args)
		{
			WorkflowResults results = new WorkflowResults(args);
			results.Status = WorkflowStatus.Running;
			return results;
		}

		#endregion
	}
}
