# installation script for Spark 2.0 on yarn on an edge node for HDinsight
based on https://github.com/hdinsight/script-actions/tree/master/install-spark2

Installation guide:
<li> Using the microsoft azure portal: create a new template deployment based on templates azureARMedgenode.json </li>
<li> Using the microsoft azure portal: in the cluster console, create a new script action based on spark2.0-sidebyside-hdinsight.sh. Select a deployment on the head nodes, workers nodes and edge node</li>
<li> log on via ssh on the edge node </li>
<li> setup the environment to use Spark 2.0 using the provided env.sh script</li>
<li> test your installation</li>
<li>two examples :
  <li> launch a spark-shell</li>
  <li> launch the SparkPI example:
  spark-submit --class org.apache.spark.examples.SparkPi \
    --master yarn \
    --deploy-mode client \
    --driver-memory 4g \
    --executor-memory 2g \
    --executor-cores 1 \
    --queue thequeue \
    $SPARK_HOME/examples/jars/spark-examples*.jar \
    10
    </li>
</li>
