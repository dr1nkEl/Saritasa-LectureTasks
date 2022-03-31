using Saritasa.JiraDayIssues.WPF.Models;

namespace Saritasa.JiraDayIssues.WPF.ViewModel;

/// <summary>
/// Issue view model class.
/// </summary>
public class IssueViewModel
{
    /// <summary>
    /// Issue Model.
    /// </summary>
    public IssueModel IssueModel { get; }

    /// <summary>
    /// Constructor.
    /// </summary>
    /// <param name="model">Issue model.</param>
    public IssueViewModel(IssueModel model)
    {
        IssueModel = model;
    }
}
