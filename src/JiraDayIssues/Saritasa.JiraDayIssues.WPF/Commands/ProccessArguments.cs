using McMaster.Extensions.CommandLineUtils;
using Saritasa.JiraDayIssues.Domain.Entities;
using Saritasa.JiraDayIssues.Infrastructure;
using Saritasa.JiraDayIssues.UseCases;
using Saritasa.JiraDayIssues.WPF.View;
using System.Windows;

namespace Saritasa.JiraDayIssues.WPF.Commands;

/// <summary>
/// Class for processing arguments.
/// </summary>
internal class ProccessArguments
{
    [Option("--username", Description = "Username.")]
    private string UserName { get; init; }

    [Option("--jtoken", Description = "Jira authorization token.")]
    private string JiraToken { get; init; }

    [Option("--ttoken", Description = "Tempo authorization token.")]
    private string TempoToken { get; init; }

    private void OnExecute()
    {
        if (!IsValid())
        {
            MessageBox.Show("All fields except datetime are required!");
            return;
        }

        var jira = new JiraAuthorizationCredentials(UserName, JiraToken);

        var tempo = new TempoAuthorizationCredentials(TempoToken);

        var jiraAccessor = new JiraAccessor(jira);

        var tempoAccesor = new TempoAccessor(tempo);

        var repository = new JiraProjectsRepository(jiraAccessor, tempoAccesor);

        var window = new MainWindow(new ViewModel.IssueViewModel(new Models.IssueModel(repository)));

        window.Show();
    }

    private bool IsValid()
    {
        if (this.UserName == null || this.TempoToken == null || this.JiraToken == null)
        {
            return false;
        }
        return true;
    }
}
