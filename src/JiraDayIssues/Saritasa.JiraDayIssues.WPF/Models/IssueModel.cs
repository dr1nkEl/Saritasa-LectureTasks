using Saritasa.JiraDayIssues.Domain.Entities;
using Saritasa.JiraDayIssues.UseCases;
using Saritasa.JiraDayIssues.WPF.Commands;
using System;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Runtime.CompilerServices;
using System.Threading;
using System.Windows;
using System.Windows.Input;

namespace Saritasa.JiraDayIssues.WPF.Models;

/// <summary>
/// Issue model.
/// </summary>
public class IssueModel : INotifyPropertyChanged
{
    private readonly JiraProjectsRepository repository;
    private DateTime selectedDate = DateTime.Now;
    private Issue selectedIssue;
    private CancellationTokenSource cancellationTokenSource = new();
    private bool isRunning;

    public bool IsRunning
    {
        get
        {
            return isRunning;
        }

        private set
        {
            isRunning = value;
            OnPropertyChanged();
        }
    }

    /// <summary>
    /// Event handler.
    /// </summary>
    public event PropertyChangedEventHandler PropertyChanged;

    /// <summary>
    /// Issue buttons.
    /// </summary>
    public ObservableCollection<Issue> Issues { get; } = new();

    /// <summary>
    /// Selected issue.
    /// </summary>
    public Issue SelectedIssue
    {
        get
        {
            return selectedIssue;
        }

        set
        {
            selectedIssue = value;
            OnPropertyChanged();
        }
    }

    /// <summary>
    /// Cancel request command for binding.
    /// </summary>
    public ICommand CancelCommand { get; }

    /// <summary>
    /// Selected date.
    /// </summary>
    public DateTime SelectedDate
    {
        get
        {
            return selectedDate;
        }

        set
        {
            selectedDate = value;
            OnPropertyChanged();
        }
    }

    /// <summary>
    /// Constructor.
    /// </summary>
    /// <param name="repository">Projects repository.</param>
    public IssueModel(JiraProjectsRepository repository)
    {
        this.repository = repository;
        PropertyChanged += Update;
        CancelCommand = new RelayCommand(() => cancellationTokenSource.Cancel(), () => cancellationTokenSource.Token.CanBeCanceled && IsRunning);
    }

    /// <summary>
    /// On property change.
    /// </summary>
    /// <param name="prop">Property name.</param>
    public void OnPropertyChanged([CallerMemberName] string prop = "")
    {
        PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(prop));
    }

    private async void Update(object sender, PropertyChangedEventArgs args)
    {
        if (args.PropertyName == nameof(SelectedDate))
        {
            try
            {
                IsRunning = true;
                var projects = await repository.GetProjectsAsync(SelectedDate, cancellationTokenSource.Token);
                lock (Issues)
                {
                    Issues.Clear();
                    foreach (var project in projects)
                    {
                        foreach (var issue in project.Issues)
                        {
                            Issues.Add(issue);
                        }
                    }
                }
            }
            catch (OperationCanceledException exc)
            {
                MessageBox.Show(exc.Message);
            }
            finally
            {
                cancellationTokenSource = new();
                IsRunning = false;
            }
            return;
        }
        if (args.PropertyName == nameof(IsRunning))
        {
            CancelCommand.CanExecute(null);
            return;
        }
    }
}
