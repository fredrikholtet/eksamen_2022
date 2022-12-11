resource "aws_cloudwatch_dashboard" "main" {
  dashboard_name = var.candidate_id
  dashboard_body = <<DEATHSTAR
{
  "widgets": [
    {
      "type": "metric",
      "x": 0,
      "y": 0,
      "width": 12,
      "height": 6,
      "properties": {
        "metrics": [
          [
            "${var.candidate_id}",
            "carts_count.value"
          ]
        ],
        "period": 300,
        "stat": "Maximum",
        "region": "eu-west-1",
        "title": "Total number of carts"
      }
    },
    {
      "type": "metric",
      "x": 10,
      "y": 0,
      "width": 12,
      "height": 6,
      "properties": {
        "metrics": [
          [
            "${var.candidate_id}",
            "carts_sum.value"
          ]
        ],
        "period": 300,
        "stat": "Maximum",
        "region": "eu-west-1",
        "title": "Total sum"
      }
    },
    {
      "type": "metric",
      "x": 0,
      "y": 10,
      "width": 12,
      "height": 6,
      "properties": {
        "metrics": [
          [
            "${var.candidate_id}",
            "checkout_carts.value"
          ]
        ],
        "period": 300,
        "stat": "sum",
        "region": "eu-west-1",
        "title": "checkout_carts.value"
      }
    },
    {
      "type": "metric",
      "x": 0,
      "y": 0,
      "width": 12,
      "height": 6,
      "properties": {
        "metrics": [
          [
            "${var.candidate_id}",
            "checkout_latency_carts.value"
          ]
        ],
        "period": 300,
        "stat": "Maximum",
        "region": "eu-west-1",
        "title": "checkout_latency_carts value"
      }
    }
  ]
}
DEATHSTAR
}
