function timer_Count(app)
    app.count = app.count + 1;
    if app.count == 60
        app.count = 0;
    end
end