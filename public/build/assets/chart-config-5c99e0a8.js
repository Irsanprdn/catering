$(document).ready(function () {
    var a = document.getElementById("salesPurchasesChart");
    $.get("/sales-purchases/chart-data", function (e) {
        new Chart(a, {
            type: "bar",
            data: {
                labels: e.sales.original.days,
                datasets: [
                    {
                        label: "Penjualan",
                        data: e.sales.original.data,
                        backgroundColor: ["#6366F1"],
                        borderColor: ["#6366F1"],
                        borderWidth: 1,
                    },
                ],
            },
            options: { scales: { y: { beginAtZero: !0 } } },
        });
    });
    var e = document.getElementById("currentMonthChart");
    $.get("/current-month/chart-data", function (a) {
        new Chart(e, {
            type: "doughnut",
            data: {
                labels: ["Penjualan", "Pengeluaran"],
                datasets: [
                    {
                        data: [a.sales, a.expenses],
                        backgroundColor: ["#F59E0B", "#EF4444"],
                        hoverBackgroundColor: ["#F59E0B", "#EF4444"],
                    },
                ],
            },
        });
    });
    var t = document.getElementById("paymentChart");
    $.get("/payment-flow/chart-data", function (a) {
        console.log(a),
            new Chart(t, {
                type: "line",
                data: {
                    labels: a.months,
                    datasets: [
                        {
                            label: "Payment Sent",
                            data: a.payment_sent,
                            fill: !1,
                            borderColor: "#EA580C",
                            tension: 0,
                        },
                        {
                            label: "Payment Received",
                            data: a.payment_received,
                            fill: !1,
                            borderColor: "#2563EB",
                            tension: 0,
                        },
                    ],
                },
            });
    });
});
