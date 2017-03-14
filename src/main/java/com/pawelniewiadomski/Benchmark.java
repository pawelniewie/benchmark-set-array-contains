package com.pawelniewiadomski;

import org.openjdk.jmh.runner.Runner;
import org.openjdk.jmh.runner.RunnerException;
import org.openjdk.jmh.runner.options.Options;
import org.openjdk.jmh.runner.options.OptionsBuilder;

public class Benchmark {
    public static void main(String[] args) throws RunnerException {
        Options opt = new OptionsBuilder()
                .include(".*")
                .warmupIterations(5)
                .measurementIterations(15)
                .forks(1)
                .jvmArgs("-server")
                .build();

        new Runner(opt).run();
    }
}
