<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Events</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&family=Poppins:wght@300;500;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
        }
    </style>
</head>
<body>
    <!-- section: ticket-list -->
    <section class="container-fluid">
        <!-- list: header -->
        <div id="list-header">
            <div class="container w-full pt-5 text-center">
                <h1>Event List</h1>
                <p>Choose an event to purchase tickets</p>
            </div>
        </div>

        <form action="" class="container w-100 p-3 d-flex flex-column gap-3 align-items-center">
            <!-- list: events -->
            <div id="list-events" class="w-75">
                <div class="d-flex flex-row align-items-center">
                    <div class="w-50">
                        <p class="p-0 m-0">All events listed here, please choose one:</p>
                    </div>
                    <div class="w-50">
                        <select name="event-name" id="eventName" class="w-100 py-2 px-3 rounded">
                            <option value="event-1">Event 1</option>
                            <option value="event-2">Event 2</option>
                            <option value="event-3">Event 3</option>
                        </select>
                    </div>
                </div>
            </div>

            <!-- list: input-count -->
            <div id="input-count" class="w-75">
                <div class="d-flex flex-row align-items-center justify-content-between">
                    <p class="p-0 m-0">No of tickets:</p>
                    <input type="text" name="event-count" id="eventCount" class="w-50 py-2 px-3 border rounded">
                </div>
            </div>

            <!-- list: submit -->
            <div id="input-submit" class="w-75 d-flex flex-row justify-content-end">
                <button type="submit" class="border w-25 py-2 rounded btn btn-primary">Purchase</button>
            </div>
        </form>

    </section>
</body>
</html>