codeunit 50100 "PDF Viewer Install"
{
    Subtype = Install;

    trigger OnInstallAppPerDatabase()
    var
        AppInfo: ModuleInfo;
    begin
        NavApp.GetCurrentModuleInfo(AppInfo);
        if AppInfo.DataVersion() = Version.Create(0, 0, 0, 0) then
            DoFreshInstall();
    end;

    local procedure DoFreshInstall()
    var
        PDFViewerUrlTxt: Label 'https://bcpdfviewer.z6.web.core.windows.net/web/viewer.html?file=', Locked = true;
        PDFViewerSetup: Record "PDF Viewer Setup";
    begin
        PDFViewerSetup.GetRecord();
        PDFViewerSetup."Web Viewer URL" := PDFViewerUrlTxt;
        PDFViewerSetup.Modify();
    end;
}