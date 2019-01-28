var iframe = window.frameElement;

iframe.parentElement.style.height = '100%';

iframe.style.maxWidth = 'none';
iframe.style.minWidth = 'none';
iframe.style.width = '100%';

iframe.style.maxHeight = 'none';
iframe.style.minHeight = '400px';
iframe.style.height = '99%';

Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('OnControlAddInReady', null);
