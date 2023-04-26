import pytest
from hello import hello


@pytest.fixture
def name():
    return "Jiang Zhu"


def test_sayhello(name):

    assert hello.SayHello(name) == "Jiang Zhu"
