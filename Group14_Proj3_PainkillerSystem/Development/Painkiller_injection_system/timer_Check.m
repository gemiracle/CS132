function timer_Check(app)
    app.time = app.time + 1;
    app.PKperhour = 0;
    app.AmountH.Text = '0.00 ml';
    if app.time == 2
        app.PKperday = 0;
        app.AmountD.Text = '0.00 ml';
        app.time = 0;
        app.DB.dismissRecord();
        app.Message.Text = 'Welcome to Painkiller injection system 2.0 !';
        app.BaselinePK.Text = '0.01 ml/min';
        app.BolusPK.Text = '0.20 ml/shot';
        app.ConfirmButton.Enable = 1;
        app.StartButton.Enable = 0;
        app.ChangeButton.Enable = 0;
    end
end

