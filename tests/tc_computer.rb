require "../src/hardware/computer"
require "test/unit"

class TestComputer < Test::Unit::TestCase

    def setup
        @comp = Computer.new()
    end

    def teardown
        ## Nothing really
    end

    def test_login
        assert_equal()
    end

    def test_message_no_args
        assert_equal()
    end

end